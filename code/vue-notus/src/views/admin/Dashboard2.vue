<template>
  <div id="myDiagramDiv" style=" width: 100%; height: 90vh; background-color: rgba(51, 65, 85, var(--tw-text-opacity));"></div>
</template>

<script>
import * as go from 'gojs';
import psy_data from '@/assets/psy_data/tree.json'

export default {
  name: 'CardGoJs',
  mounted() {
    this.initDiagram();
  },
  methods: {
    initDiagram() {
      const myDiagram = go.GraphObject.make(go.Diagram, "myDiagramDiv", {
        allowCopy: false,
        "draggingTool.dragsTree": true,
        "commandHandler.deletesTree": true,
        layout: go.GraphObject.make(go.TreeLayout, {
          angle: 90,
          arrangement: go.TreeArrangement.FixedRoots,
        }),
        "undoManager.isEnabled": true,
      });


        // when the document is modified, add a "*" to the title and enable the "Save" button
        myDiagram.addDiagramListener('Modified', (e) => {
          console.log(e)
          var button = document.getElementById('SaveButton');
          if (button) button.disabled = !myDiagram.isModified;
          var idx = document.title.indexOf('*');
          if (myDiagram.isModified) {
            if (idx < 0) document.title += '*';
          } else {
            if (idx >= 0) document.title = document.title.slice(0, idx);
          }
        });

        go.Shape.defineFigureGenerator('Van', function (shape, w, h) {
          var geo = go.Geometry.parse(
            'M37.409,18.905l-4.946-7.924c-0.548-0.878-1.51-1.411-2.545-1.411H3c-1.657,0-3,1.343-3,3v16.86c0,1.657,1.343,3,3,3h0.787 c0.758,1.618,2.391,2.75,4.293,2.75s3.534-1.132,4.292-2.75h20.007c0.758,1.618,2.391,2.75,4.293,2.75 c1.9,0,3.534-1.132,4.291-2.75h0.787c1.656,0,3-1.343,3-3v-2.496C44.75,22.737,41.516,19.272,37.409,18.905z M8.087,32.395 c-1.084,0-1.963-0.879-1.963-1.963s0.879-1.964,1.963-1.964s1.963,0.88,1.963,1.964S9.171,32.395,8.087,32.395z M26.042,21.001 V15.57v-2.999h3.876l5.264,8.43H26.042z M36.671,32.395c-1.084,0-1.963-0.879-1.963-1.963s0.879-1.964,1.963-1.964 s1.963,0.88,1.963,1.964S37.755,32.395,36.671,32.395z'
          );
          return geo.scale(w / geo.bounds.width, h / geo.bounds.height);
        });
        go.Shape.defineFigureGenerator('SUV', function (shape, w, h) {
          var geo = go.Geometry.parse(
            'M246,90.011V59.995c0-5.523-4.48-9.995-10-9.995h-50L156.97,6.416C155.11,3.634,152.34,2,149,2H28 c-5.52,0-10,4.446-10,9.969V30h-8c-4.42,0-8,3.56-8,7.983v40.022C2,82.427,5.58,86,10,86h8v20h16.458 c2.8-15.959,16.702-28.066,33.462-28.066c16.75,0,30.708,12.107,33.518,28.066h72.958c2.8-15.959,16.764-28.066,33.524-28.066 c16.75,0,30.624,12.107,33.434,28.066H250c4.42,0,8-3.563,8-7.985v-8.004H246z M86,50H30V13.97h56V50z M98,50V13.97h48L170,50H98z M68,138c-14.336,0-26.083-11.706-26.083-26.051s11.664-26.014,26-26.014s26,11.669,26,26.014S82.336,138,68,138z M67.917,99.943 c-6.617,0-12,5.386-12,12.006c0,6.621,5.383,12.006,12,12.006s12-5.386,12-12.006C79.917,105.329,74.534,99.943,67.917,99.943z M208,138c-14.337,0-26.083-11.706-26.083-26.051s11.663-26.014,26-26.014s26,11.669,26,26.014S222.337,138,208,138z M207.917,99.943c-6.617,0-12,5.386-12,12.006c0,6.621,5.383,12.006,12,12.006s12-5.386,12-12.006 C219.917,105.329,214.534,99.943,207.917,99.943z'
          );
          return geo.scale(w / geo.bounds.width, h / geo.bounds.height);
        });
        go.Shape.defineFigureGenerator('Hammer', function (shape, w, h) {
          var geo = go.Geometry.parse(
            'M19 5.5a4.5 4.5 0 01-4.791 4.49c-.873-.055-1.808.128-2.368.8l-6.024 7.23a2.724 2.724 0 11-3.837-3.837L9.21 8.16c.672-.56.855-1.495.8-2.368a4.5 4.5 0 015.873-4.575c.324.105.39.51.15.752L13.34 4.66a.455.455 0 00-.11.494 3.01 3.01 0 001.617 1.617c.17.07.363.02.493-.111l2.692-2.692c.241-.241.647-.174.752.15.14.435.216.9.216 1.382zM4 17a1 1 0 100-2 1 1 0 000 2z'
          );
          return geo.scale(w / geo.bounds.width, h / geo.bounds.height);
        });


      const regularNodeColor = (category) => {
          if (category == 'write') {
            return '#155e75'
          }
          if (category == 'read') {
            return '#7D1C4A'
          }
          if (category == 'persol') {
            return '#493D60'
          }
          return '#155e75'
        }
        
        go.Shape.defineFigureGenerator('Van', function (shape, w, h) {
          var geo = go.Geometry.parse(
            'M37.409,18.905l-4.946-7.924c-0.548-0.878-1.51-1.411-2.545-1.411H3c-1.657,0-3,1.343-3,3v16.86c0,1.657,1.343,3,3,3h0.787 c0.758,1.618,2.391,2.75,4.293,2.75s3.534-1.132,4.292-2.75h20.007c0.758,1.618,2.391,2.75,4.293,2.75 c1.9,0,3.534-1.132,4.291-2.75h0.787c1.656,0,3-1.343,3-3v-2.496C44.75,22.737,41.516,19.272,37.409,18.905z M8.087,32.395 c-1.084,0-1.963-0.879-1.963-1.963s0.879-1.964,1.963-1.964s1.963,0.88,1.963,1.964S9.171,32.395,8.087,32.395z M26.042,21.001 V15.57v-2.999h3.876l5.264,8.43H26.042z M36.671,32.395c-1.084,0-1.963-0.879-1.963-1.963s0.879-1.964,1.963-1.964 s1.963,0.88,1.963,1.964S37.755,32.395,36.671,32.395z'
          );
          return geo.scale(w / geo.bounds.width, h / geo.bounds.height);
        });
        go.Shape.defineFigureGenerator('SUV', function (shape, w, h) {
          var geo = go.Geometry.parse(
            'M246,90.011V59.995c0-5.523-4.48-9.995-10-9.995h-50L156.97,6.416C155.11,3.634,152.34,2,149,2H28 c-5.52,0-10,4.446-10,9.969V30h-8c-4.42,0-8,3.56-8,7.983v40.022C2,82.427,5.58,86,10,86h8v20h16.458 c2.8-15.959,16.702-28.066,33.462-28.066c16.75,0,30.708,12.107,33.518,28.066h72.958c2.8-15.959,16.764-28.066,33.524-28.066 c16.75,0,30.624,12.107,33.434,28.066H250c4.42,0,8-3.563,8-7.985v-8.004H246z M86,50H30V13.97h56V50z M98,50V13.97h48L170,50H98z M68,138c-14.336,0-26.083-11.706-26.083-26.051s11.664-26.014,26-26.014s26,11.669,26,26.014S82.336,138,68,138z M67.917,99.943 c-6.617,0-12,5.386-12,12.006c0,6.621,5.383,12.006,12,12.006s12-5.386,12-12.006C79.917,105.329,74.534,99.943,67.917,99.943z M208,138c-14.337,0-26.083-11.706-26.083-26.051s11.663-26.014,26-26.014s26,11.669,26,26.014S222.337,138,208,138z M207.917,99.943c-6.617,0-12,5.386-12,12.006c0,6.621,5.383,12.006,12,12.006s12-5.386,12-12.006 C219.917,105.329,214.534,99.943,207.917,99.943z'
          );
          return geo.scale(w / geo.bounds.width, h / geo.bounds.height);
        });
        go.Shape.defineFigureGenerator('Hammer', function (shape, w, h) {
          var geo = go.Geometry.parse(
            'M19 5.5a4.5 4.5 0 01-4.791 4.49c-.873-.055-1.808.128-2.368.8l-6.024 7.23a2.724 2.724 0 11-3.837-3.837L9.21 8.16c.672-.56.855-1.495.8-2.368a4.5 4.5 0 015.873-4.575c.324.105.39.51.15.752L13.34 4.66a.455.455 0 00-.11.494 3.01 3.01 0 001.617 1.617c.17.07.363.02.493-.111l2.692-2.692c.241-.241.647-.174.752.15.14.435.216.9.216 1.382zM4 17a1 1 0 100-2 1 1 0 000 2z'
          );
          return geo.scale(w / geo.bounds.width, h / geo.bounds.height);
        });
        
        // each regular Node has body consisting of a title followed by a collapsible list of actions,
        // controlled by a PanelExpanderButton, with a TreeExpanderButton underneath the body
        myDiagram.nodeTemplate = // the default node template
          new go.Node('Vertical', { selectionObjectName: 'BODY' })
            // the main "BODY" consists of a RoundedRectangle surrounding nested Panels
            .bindTwoWay('isTreeExpanded') // remember the expansion state for
            .bindTwoWay('wasTreeExpanded') //   when the model is re-loaded
            .add(
              new go.Panel('Auto', { name: 'BODY' })
                .add(
                  new go.Shape('RoundedRectangle', { strokeWidth: 0 }).bind('fill', 'method', regularNodeColor),
                  new go.Panel('Vertical', { margin: 3 })
                    .add(
                      // the title
                      new go.TextBlock({
                        stretch: go.Stretch.Horizontal,
                        font: 'bold 12pt Verdana, sans-serif',
                        stroke: 'white'
                      })
                        .bind('text', 'question'),
                      // the optional list of actions
                      new go.Panel('Vertical', {
                        stretch: go.Stretch.Horizontal,
                        visible: false
                      }) // not visible unless there is at least one action
                        .bind('visible', 'actions', (acts) => Array.isArray(acts) && acts.length > 0)
                        .add(
                          // headered by a label and a PanelExpanderButton inside a Table
                          new go.Panel('Table', { stretch: go.Stretch.Horizontal })
                            .add(
                              new go.TextBlock('Example', {
                                alignment: go.Spot.Left,
                                font: '10pt Verdana, sans-serif',
                                stroke: 'white'
                              }),
                              go.GraphObject.build('PanelExpanderButton',
                                {
                                  column: 1,
                                  alignment: go.Spot.Right,
                                  'ButtonIcon.stroke': 'white'
                                },
                                'COLLAPSIBLE' // name of the object to make visible or invisible
                              ), // end Table panel
                          // with the list data bound in the Table Panel
                          new go.Panel('Table', {
                            name: 'COLLAPSIBLE', // identify to the PanelExpanderButton
                            visible: false, // default close
                            padding: 2,
                            defaultAlignment: go.Spot.Left, // thus no need to specify alignment on each element
                            defaultSeparatorPadding: 3,
                            itemTemplate: new go.Panel('TableRow').add(
                                new go.Shape({ column: 0, width: 20, height: 20, fill: null }).bind('figure').theme('stroke', 'text'),
                                new go.TextBlock({ column: 1 }, { font: '11pt Verdana, sans-serif' }).bind('text').theme('stroke', 'text'),
                                new go.TextBlock({ column: 2, font: '11pt Verdana, sans-serif' })
                                  .bindObject('text', 'itemIndex', (i) => `[${i}]`)
                                  .theme('stroke', 'text')
                              ) // the Panel created for each item in Panel.itemArray
                          })
                            .theme('background', 'div')
                            .bind('itemArray', 'actions')
                            ) // end Table panel
                          // bind Panel.itemArray to nodedata.actions
                        ) // end optional Vertical Panel
                    ) // end outer Vertical Panel
                ), // end "BODY"  Auto Panel
              new go.Panel( // this is underneath the "BODY"
                { height: 17 }) // always this height, even if the TreeExpanderButton is not visible
                .add(go.GraphObject.build('TreeExpanderButton'))
            );




        // define a second kind of Node:
        myDiagram.nodeTemplateMap.add(
          'Terminal',
          new go.Node('Spot')
            .add(
              new go.Shape('Circle', { width: 55, height: 55, strokeWidth: 0 }).theme('fill', 'terminal'),
              new go.TextBlock({ font: '10pt Verdana, sans-serif', stroke: 'white' }).bind('text')
            )
        );
      /*
        myDiagram.linkTemplate = new go.Link(
          { routing: go.Routing.Orthogonal, deletable: false, corner: 10, toShortLength: 4 }
        )
          .add(
            new go.Shape({ strokeWidth: 2, stroke: 'white' }), // 白色のリンク
            new go.Shape({ toArrow: 'Standard', strokeWidth: 0, fill: 'white' }) // 白色の矢印
          );
      */
         // replace the default Link template in the linkTemplateMap
    myDiagram.linkTemplate = new go.Link( // the whole link panel
      {
        // path animation works with these kinds of links too:
        // routing: go.Routing.AvoidsNodes,
        // curve: go.Curve.Bezier,
      })
        .add(
          new go.Shape({ stroke: 'white' }), // the link shape
          new go.Shape({ toArrow: 'standard', stroke: null,  fill: 'white' }), // the arrowhead
          new go.Panel('Auto')
            .add(
              new go.Shape({ // the label background, which becomes transparent around the edges
                fill: new go.Brush('Radial', { 0: 'rgb(240, 240, 240)', 0.3: 'rgb(240, 240, 240)', 1: 'rgba(240, 240, 240, 0)' }),
                stroke: null
              }),
              new go.TextBlock({ // the label text
                textAlign: 'center',
                font: '10pt helvetica, arial, sans-serif',
                stroke: '#555555',
                margin: 4
              })
                .bind('text')
            )
        );
    myDiagram.nodeTemplateMap.add(
      'token',
      new go.Part({ locationSpot: go.Spot.Center, layerName: 'Foreground' })
        .add(
          new go.Shape('Circle', { width: 12, height: 12, fill: 'green', strokeWidth: 0 }).bind('fill', 'color')
        )
    );
      myDiagram.layout = new go.ForceDirectedLayout({ // automatically spread nodes apart
        defaultElectricalCharge: 300,
        defaultSpringLength: 150
      }),
      myDiagram.model = go.Model.fromJson(psy_data);
        

    function initTokens() {
    var oldskips = myDiagram.skipsUndoManager;
    myDiagram.skipsUndoManager = true;
    myDiagram.model.addNodeDataCollection([
      { category: 'token', at: 1, color: 'green' },
      { category: 'token', at: 2, color: 'blue' },
      { category: 'token', at: 4, color: 'yellow' },
      { category: 'token', at: 5, color: 'purple' },
      { category: 'token', at: 7, color: 'red' },
      { category: 'token', at: 8, color: 'black' },
      { category: 'token', at: 9, color: 'green' },
      { category: 'token', at: 11, color: 'blue' },
      { category: 'token', at: 12, color: 'yellow' },
      { category: 'token', at: 17, color: 'purple' },
      { category: 'token', at: 18, color: 'red' }
    ]);
    myDiagram.skipsUndoManager = oldskips;
    window.requestAnimationFrame(updateTokens);
  }
    
  function updateTokens() {
    var oldskips = myDiagram.skipsUndoManager;
    myDiagram.skipsUndoManager = true; // don't record these changes in the UndoManager!
    var temp = new go.Point();
    myDiagram.parts.each((token) => {
      var data = token.data;
      if (!data) return;
      var at = data.at;
      if (at === undefined) return;
      var from = myDiagram.findNodeForKey(at);
      if (from === null) return;
      var frac = data.frac;
      if (frac === undefined) frac = 0.0;
      var next = data.next;
      var to = myDiagram.findNodeForKey(next);
      if (to === null) {
        // nowhere to go?
        positionTokenAtNode(token, from); // temporarily stay at the current node
        data.next = chooseDestination(token, from); // and decide where to go next
      } else {
        // proceed toward the "to" port
        var link = from.findLinksTo(to).first();
        if (link !== null) {
          token.location = link.path.getDocumentPoint(link.path.geometry.getPointAlongPath(frac, temp));
        } else {
          // stay at the current node
          positionTokenAtNode(token, from);
        }
        if (frac >= 1.0) {
          // if beyond the end, it's "AT" the NEXT node
          data.frac = 0.0;
          data.at = next;
          data.next = undefined; // don't know where to go next
        } else {
          // otherwise, move fractionally closer to the NEXT node
          data.frac = frac + 0.01;
        }
      }
    });
    myDiagram.skipsUndoManager = oldskips;
    window.requestAnimationFrame(updateTokens);
  }

    // determine where to position a token when it is resting at a node
    function positionTokenAtNode(token, node) {
    // these details depend on the node template
    token.location = node.position.copy().offset(4 + 6, 5 + 6);
  }

  function chooseDestination(token, node) {
    var dests = new go.List().addAll(node.findNodesOutOf());
    if (dests.count > 0) {
      var dest = dests.elt(Math.floor(Math.random() * dests.count));
      return dest.data.key;
    }
    var arr = myDiagram.model.nodeDataArray;
    // choose a random next data object that is not a token and is not the current Node
    var data = null;
    while (data === null || data.category === 'token' || data.key === node.data.key) {
      var i = Math.floor(Math.random() * arr.length);
      data = arr[i];
    }
    // if the data object is a node, return its key
    return data.key;
  }

    initTokens();
    
    }


  },
};
</script>

<style scoped>
/* 必要ならスタイルを追加 */
</style>
